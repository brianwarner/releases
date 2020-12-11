FROM nginx:alpine

RUN apk add vim
COPY cfg/vimrc /etc/vim/vimrc


ARG CDN_ACCESS_KEY=bar
#ENV CDN_ACCESS_KEY=$SOMETHING
COPY cfg/default.conf /etc/nginx/conf.d/default.conf
RUN sed -i s/CDN_ACCESS_KEY/$CDN_ACCESS_KEY/g /etc/nginx/conf.d/default.conf
#COPY cdn/* /usr/share/nginx/html

EXPOSE 80

