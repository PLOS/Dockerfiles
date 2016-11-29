function list_projects {
  echo "$(find projects/*/build-image.sh | awk -F/ '{print $(NF-1)}')"
}

function list_stacks {
  echo "$(find configurations/*.yml -exec basename -s .yml -a {} +)"
}

function get_images_from_config {
  CONFIG_FILE=$1
  echo $(docker-compose -f $CONFIG_FILE config | grep '^ *image:' | sed 's/.*image: *\([^ ][^ ]*\).*$/\1/')
}
