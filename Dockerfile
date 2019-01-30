FROM mongo

LABEL Author="Thomas Liebberger - thomasliebberger@gmail.com"

ADD docker-entrypoint.sh /docker-entrypoint.sh
ADD create_user.sh /create_user.sh

RUN chmod +x /docker-entrypoint.sh
RUN chmod +x /create_user.sh
EXPOSE 27017 27017

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "mongod" ]