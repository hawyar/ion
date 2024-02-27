const queue = ion.queue();

(function doSomething() {
  Array.from({ length: 5 }).forEach((i) => {
    queue.add(() => {
      console.log("do something with", i);
    });
  });
})();
