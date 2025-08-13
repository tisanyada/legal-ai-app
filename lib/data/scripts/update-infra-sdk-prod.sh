echo "...[REBUILDING-AUTH-SDK-PROCESSING]"
echo " "

openapi-generator generate -i http://localhost:3000/docs/auth-service-json -g dart-dio -o ../infra_sdk/auth --enable-post-process-file --additional-properties=pubName=auth_sdk,pubLibrary=auth_api.api

echo " "
echo "...[REBUILDING-AUTH-SDK-SUCCESS]"
echo " "


echo "...[REBUILDING-ACCOUNT-SDK-PROCESSING]"
echo " "

openapi-generator generate -i http://localhost:3000/docs/account-service-json -g dart-dio -o ../infra_sdk/account --enable-post-process-file --additional-properties=pubName=account_sdk,pubLibrary=account_api.api

echo " "
echo "...[REBUILDING-ACCOUNT-SDK-SUCCESS]"
echo " "


# echo "...[REBUILDING-LEGAL-SDK-PROCESSING]"
# echo " "

# openapi-generator generate -i http://localhost:3000/docs/legal-service-json -g dart-dio -o ../infra_sdk/legal --enable-post-process-file --additional-properties=pubName=legal_sdk,pubLibrary=legal_api.api

# echo " "
# echo "...[REBUILDING-LEGAL-SDK-SUCCESS]"
# echo " "

sh update-infra-sdk-files.sh

sh build-infra-sdk.sh
