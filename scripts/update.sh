#!/bin/bash

php bin/update-metadata.php \
      --metadata-url ${METADATA_SOURCE} \
      --metadata-idp-file etc/IDProvider.metadata.php \
      --metadata-sp-file etc/SProvider.metadata.php \
      --verbose
