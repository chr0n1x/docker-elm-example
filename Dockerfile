FROM       codesimple/elm:0.17
MAINTAINER Kevin Ran <heilong24@gmail.com>

ADD     . /usr/src/app

WORKDIR    /usr/src/app
ENTRYPOINT ["elm-reactor"]
CMD        ["--address", "0.0.0.0"]
