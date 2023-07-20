FROM ubuntu:22.04
RUN apt update && apt-get install -y openssh-server
RUN echo 'root:hotoxiao' | chpasswd
RUN mkdir /var/run/sshd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords yes/' /etc/ssh/sshd_config

CMD ["/usr/sbin/sshd", "-D"]
