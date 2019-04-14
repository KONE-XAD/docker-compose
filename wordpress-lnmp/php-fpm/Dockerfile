FROM centos:7.5.1804
MAINTAINER "XAD" 1793360097@qq.com
WORKDIR /code
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone && \
    curl -o /etc/yum.repos.d/epel-7.repo http://mirrors.aliyun.com/repo/epel-7.repo && \
    curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo && \
    yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum install -y yum-utils && \
    yum-config-manager --enable remi-php71 && \
    yum install -y php71-php php71-php-gd php71-php-cli php71-php-common php71-php-devel php71-php-embedded php71-php-mcrypt php71-php-mbstring php71-php-pdo php71-php-xml php71-php-fpm php71-php-mysqlnd php71-php-opcache php71-php-pecl-memcached php71-php-pecl-redis php71-php-pecl-mongodb && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    useradd webuser && \
    sed -i 's/= apache/= webuser/g' /etc/opt/remi/php71/php-fpm.d/www.conf && \
    sed -i 's/127.0.0.1/0.0.0.0/g' /etc/opt/remi/php71/php-fpm.d/www.conf && \
    sed -i 's/listen.allowed_clients/;listen.allowed_clients/g' /etc/opt/remi/php71/php-fpm.d/www.conf
ADD start_fpm.sh /start_fpm.sh
EXPOSE 9000
#ENTRYPOINT ["/opt/remi/php71/root/usr/sbin/php-fpm","--nodaemonize"]
ENTRYPOINT ["/bin/bash","/start_fpm.sh"]
