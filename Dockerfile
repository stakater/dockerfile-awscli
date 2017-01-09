FROM    stakater/base-alpine
LABEL   authors="Hazim <hazim_malik@hotmail.com>"

RUN     apk -Uuv add groff less python py-pip && \
        pip install awscli && \
        apk --purge -v del py-pip && \
        rm /var/cache/apk/*

# Expose volume for AWS credentials
VOLUME  ["/root/.aws"]
# Expose the working directory
VOLUME 	["/aws"]

WORKDIR "/aws"