FROM centos:7.5.1804
MAINTAINER "XAD" 1793360097@qq.com
WORKDIR /code
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone && \
    curl -o /etc/yum.repos.d/epel-7.repo http://mirrors.aliyun.com/repo/epel-7.repo && \
    curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo && \
    rpm -ivh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm && \
    yum install nginx -y \
    yum clean all && \
    rm -rf /var/cache/yum && \
    mkdir -p /code/wordpress && \
    useradd webuser && \
    chown webuser.webuser -R /code
ADD nginx.conf /etc/nginx/nginx.conf
ADD wordpress.conf /etc/nginx/conf.d/default.conf
ADD start_nginx.sh /start_nginx.sh
EXPOSE 80
ENTRYPOINT ["/bin/bash","/start_nginx.sh"]
