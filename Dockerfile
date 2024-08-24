FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y openssh-server && \
    apt-get install -y curl && \
    apt-get install -y sudo && \
    mkdir /var/run/sshd

# Add #VAGRANT-BEGIN and #VAGRANT-END markers to /etc/fstab
RUN echo "#VAGRANT-BEGIN" >> /etc/fstab && \
    echo "#VAGRANT-END" >> /etc/fstab

RUN useradd -m -s /bin/bash vagrant && \
    echo "vagrant:insecure_password" | chpasswd && \
    mkdir /home/vagrant/.ssh && \
    chmod 0700 /home/vagrant/.ssh && \
    sed -i 's/^#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i '/^#\?PubkeyAuthentication/c\PubkeyAuthentication yes' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    echo "vagrant ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    curl -L https://raw.githubusercontent.com/hashicorp/vagrant/main/keys/vagrant.pub -o /home/vagrant/.ssh/authorized_keys && \
    chmod 0600 /home/vagrant/.ssh/authorized_keys && \
    chown -R vagrant:vagrant /home/vagrant/.ssh && \
    service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]