remote_repo="docker.internal.net:5093"
#docker login $remote_repo

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
        echo "Tagging: $i to $remote_repo/$(basename $i)"
        docker tag $i $remote_repo/$(basename $i);
        echo "";
done
echo ""
}

push_2_dest() {
echo "Pushing images"
for i in `cat imglist`; do
        echo "Pushing: $remote_repo/$(basename $i)"
        docker push $remote_repo/$(basename $i);
        echo "";
done
}

load_tar_files
tag_2_dest
push_2_dest

echo "All Done..."
