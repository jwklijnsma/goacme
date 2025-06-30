FROM ubuntu:24.04
LABEL maintainer="janwiebe@janwiebe.eu"

RUN     apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y \
           ca-certificates  \   
           curl \    
           wget \  
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
	;
RUN wget https://github.com/go-acme/lego/releases/download/v4.23.1/lego_v4.23.1_linux_amd64.tar.gz
RUN tar -xvzf lego_v4.23.1_linux_amd64.tar.gz
RUN mv lego /usr/local/bin/lego 
RUN chmod +x /usr/local/bin/lego
CMD ["/bin/bash"]
