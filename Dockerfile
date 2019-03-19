FROM centos:latest
#download exaBGP 
RUN cd /var/tmp \
	&& curl -L https://github.com/Exa-Networks/exabgp/archive/3.4.17.tar.gz | tar zx
# create directories
RUN mkdir -p /exaBGPinstance \
	&& mkdir -p /exaBGPinstance/conf \
	&& mkdir -p /exaBGPinstance/mgmtapi \
	&& cd /exaBGPinstance \
	&& cp /var/tmp/exabgp-3.4.17/sbin/exabgp /exaBGPinstance \
	&& chmod +x /exaBGPinstance/exabgp
# copy entrypoint to start the process
COPY entrypoint.sh /
COPY exabgp.conf /exaBGPinstance/conf/
COPY mgmtprocess.py /exaBGPinstance/mgmtapi/
RUN chmod +x /entrypoint.sh
#
CMD ["/entrypoint.sh"]
