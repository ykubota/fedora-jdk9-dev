FROM fedora
WORKDIR /root
EXPOSE 22
CMD /sshd.sh
ADD sshd.sh /sshd.sh
RUN : \
 && dnf update -y \
 && dnf install -y \
      openssh-server \
      ca-certificates \
      hg \
      make \
      java-1.8.0-openjdk-devel \
      alsa-lib-devel cups-devel freetype-devel ccache \
      libXtst-devel libXt-devel libXrender-devel libXi-devel \
 && dnf groupinstall -y "C Development Tools and Libraries" \
 && dnf groupinstall -y "Development Tools" \
 && dnf groupinstall -y "RPM Development Tools" \
 && hg clone http://hg.openjdk.java.net/jdk9/dev jdk9-dev \
 && cd jdk9-dev \
 && bash get_source.sh \
 && bash configure \
 && make \
 && :
