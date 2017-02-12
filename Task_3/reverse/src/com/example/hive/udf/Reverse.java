package com.example.hive.udf;

import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.hadoop.io.Text;

public final class Reverse extends UDF {
    public Text evaluate(final Text s) {
        if (s == null) { return null; }
        char str[] = s.toString().toCharArray();
        char rev_str[] = s.toString().toCharArray();
        for (int i = 0; i < str.length; i++) {
            rev_str[str.length-i-1] = str[i];
        }
        return new Text(new String (rev_str));
    }
}
