# nodejs-12-run
FROM openshift/base-centos7

# TODO: Put the maintainer name in the image metadata
LABEL maintainer="Nilber Vittorazzi <nilber@vittorazzi.com>"

# TODO: Rename the builder environment variable to inform users about application you provide them
ENV BUILDER_VERSION 1.0

# TODO: Set labels used in OpenShift to describe the builder image
LABEL io.k8s.description="NodeJS 12" \
    io.k8s.display-name="NodeJS 12" \
    io.openshift.expose-services="8080:http" \
    io.openshift.tags="builder,node,nodejs." \
    io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

# TODO: Install required packages here:
# RUN yum install -y ... && yum clean all -y
RUN yum install -y gcc-c++ make && yum update tzdata -y

RUN curl -sL https://rpm.nodesource.com/setup_12.x | bash -

RUN yum install -y urw-fonts freetype* install gcc gcc-c++ make flex bison gperf ruby \
  openssl-devel freetype-devel fontconfig-devel libicu-devel sqlite-devel \
  libpng-devel libjpeg-devel

RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
    && tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2 -C /usr/local/share/ \
    && rm -f phantomjs-2.1.1-linux-x86_64.tar.bz2 \
    && ln -sf /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin \
    && phantomjs --version

RUN yum install -y nodejs && yum clean all -y
#RUN gem install asdf

# TODO (optional): Copy the builder files into /opt/app-root
#COPY ./* /opt/app-root/
COPY ./* /opt/app-root/

# TODO: Copy the S2I scripts to /usr/libexec/s2i, since openshift/base-centos7 image
# sets io.openshift.s2i.scripts-url label that way, or update that label
COPY ./s2i/bin/ /usr/libexec/s2i

# TODO: Drop the root user and make the content of /opt/app-root owned by user 1001
RUN chown -R 1001:1001 /opt/app-root

RUN ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

# This default user is created in the openshift/base-centos7 image
USER 1001

RUN date
# TODO: Set the default port for applications built using this image
EXPOSE 4000

#WORKDIR /opt/app-root/code

# TODO: Set the default CMD for the image
CMD ["/usr/libexec/s2i/usage"]
