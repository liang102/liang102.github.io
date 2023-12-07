var posts=["2023/12/07/constructing/index/","2023/12/07/hello-world/index/"];function toRandomPost(){
    pjax.loadUrl('/'+posts[Math.floor(Math.random() * posts.length)]);
  };