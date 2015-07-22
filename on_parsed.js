function func(man,notemodel) {
    console.log("parsed from js");
    for (var i=0;i<man.getSize();i++)
        notemodel.append({
                  "name":man.getNote(i).getSum()+" ",
                  "description":man.getNote(i).getCom()
                 });
}

