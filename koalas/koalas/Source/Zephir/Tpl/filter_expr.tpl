    // {{CM}}
    public function {{FN}}(var val) -> array
    {
        int i, last = count(this->lst);
        var itm;
        let last--;
        var tmp = [];
        for i in range(0, last) {
            let itm = this->lst[i];
            if (itm->id {{OP}} val) || (itm->text {{OP}} val) {
                let tmp[] = itm;
            }
        }
        return tmp;
    }