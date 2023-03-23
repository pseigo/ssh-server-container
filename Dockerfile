# syntax=docker/dockerfile:1
# escape=`

FROM --platform=linux/amd64 alpine:latest

RUN apk update && apk add vim openssh-server openssh

RUN ssh-keygen -A

RUN echo "root:ROOT_PASSWORD!" | chpasswd

# Comment out existing 'PermitRootLogin' and 'PasswordAuthentication' lines
RUN sed -E 's/^(\w*PasswordAuthentication.*)$/#\1/g' /etc/ssh/sshd_config
RUN sed -E 's/^(\w*PermitRootLogin.*)$/#\1/g' /etc/ssh/sshd_config

# Allow password auth for logging in as root
RUN echo "" >> /etc/ssh/sshd_config && `
    echo "# SSH Server Container options" >> /etc/ssh/sshd_config && `
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config && `
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

# why no work?
#RUN ["/usr/sbin/sshd"]
#RUN /usr/sbin/sshd &

#CMD ["/bin/ash"]

