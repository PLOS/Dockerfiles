FROM alpine

COPY . /root/themes

VOLUME /root/themes

# TODO: pull down and overwrite:
# code/general/Plos/ftl/common/userMgmtBaseUrl.ftl:<#assign userMgmtBaseUrl = '${AKITA_URL}'/>

# HACK: run something in the foregroud so this is accessable at run time
CMD tail -f /dev/null
