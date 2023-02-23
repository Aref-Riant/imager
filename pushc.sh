remote_repo="misseprepo.systemgroup.net:8843"
#docker login $remote_repo 8843 5093

load_tar_files() {
echo "Loading tar images to local docker"
for i in `ls images`; do
        echo "Loading: images/$i"
        docker load < images/$i;
        echo ""
done
echo ""
}

tag_2_dest() {
echo "Tagging images"
for i in `cat imglist`; do
        echo "Tagging: $i to $remote_repo/$i"
        docker tag $i $remote_repo/$i;
        echo "";
done
echo ""
}

push_2_dest() {
echo "Pushing images"
for i in `cat imglist`; do
        echo "Pushing: $remote_repo/$i"
        docker push $remote_repo/$i;
        echo "";
done
}

load_tar_files
tag_2_dest
push_2_dest

echo "All Done..."
