echo "...[REMOVING-OLD-SDK-VERSION]"

if [ -d "../infra_sdk" ]; then
    echo "...[REMOVING-OLD-SDK-VERSION]"
    rm -rf ../infra_sdk
    echo "...[REMOVED-OLD-SDK-VERSION]"
else
    echo "...[NO-EXISTING-SDK-TO-REMOVE]"
fi

echo "...[REMOVED-OLD-SDK-VERSION]"



echo "...[CREATING-DIRECTORY-FOR-SDK]"
echo " "

mkdir ../infra_sdk

cd ../infra_sdk 

mkdir auth account legal

# cd ../

echo " "
echo "...[CREATED-DIRECTORY-FOR-SDK]"



echo "...[GENERATE-SDKS-PROCESSING]"
echo " "

echo "...[GENERATE-AUTH-SDK-PROCESSING]"
echo " "
openapi-generator generate -i http://localhost:3000/docs/auth-service-json -g dart-dio -o ../infra_sdk/auth --enable-post-process-file --additional-properties=pubName=auth_sdk,pubLibrary=auth_api.api

echo " "
echo "...[GENERATE-AUTH-SDK-SUCCESS]"
echo " "

echo "...[GENERATE-ACCOUNT-SDK-PROCESSING]"
echo " "
openapi-generator generate -i http://localhost:3000/docs/account-service-json -g dart-dio -o ../infra_sdk/account --enable-post-process-file --additional-properties=pubName=account_sdk,pubLibrary=account_api.api

echo " "
echo "...[GENERATE-ACCOUNT-SDK-SUCCESS]"
echo " "


echo " "
echo "...[GENERATE-LEGAL-SDK-PROCESSING]"
echo " "
openapi-generator generate -i http://localhost:3000/docs/legal-service-json -g dart-dio -o ../infra_sdk/legal --enable-post-process-file --additional-properties=pubName=legal_sdk,pubLibrary=legal_api.api

echo " "
echo "...[GENERATE-LEGAL-SDK-SUCCESS]"
echo " "

echo " "
echo "...[GENERATE-SDKS-SUCCESSFUL]"
