
ARG VERSION=v1
FROM httpd:${VERSION}
MAINTAINER MUNGARA
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y
RUN yum install -y curl httpd iputils git
EXPOSE 80
COPY ./website/ /var/www/html/
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]

 

