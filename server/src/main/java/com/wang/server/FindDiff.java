package com.wang.server;

import java.io.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.TreeSet;
import java.util.stream.Collectors;

public class FindDiff {
    public static void main(String[] args) {
        File db = new File("C:\\Users\\laowang\\Desktop\\db.txt");
        File biao = new File("C:\\Users\\laowang\\Desktop\\biao.txt");
//        diff(db,biao);
//        iscopy(db);
        BufferedReader dbread = null;
        try {
            dbread = new BufferedReader(new InputStreamReader(new FileInputStream(db)));
            List<String> dblist = new ArrayList<>();
            String con="";
            while ((con=dbread.readLine())!=null){
                dblist.add(con);
            }
            List<String> elements = getDuplicateElements(dblist);
            System.out.println(elements.get(0));
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void diff(File db, File biao){
        try {
            BufferedReader dbread = new BufferedReader(new InputStreamReader(new FileInputStream(db)));
            BufferedReader biaoread = new BufferedReader(new InputStreamReader(new FileInputStream(biao)));
            List<String> dblist = new ArrayList<>();
            List<String> biaolist = new ArrayList<>();
//            System.out.println(dbread.readLine());
            String con=null;
            while ((con =dbread.readLine())!=null){
                dblist.add(con.toUpperCase());
            }
            String con2=null;
            while ((con2=biaoread.readLine())!=null){
                biaolist.add(con2.toUpperCase());
            }
            System.out.println(dblist.size());
            System.out.println(biaolist.size());
            dblist.removeAll(biaolist);
            System.out.println("差集======"+dblist.size());
            System.out.println(dblist.get(0));
            for (int i = 0; i <dblist.size() ; i++) {
                System.out.println("差集"+dblist.get(i));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void iscopy(File db){
        try {
            BufferedReader dbread = new BufferedReader(new InputStreamReader(new FileInputStream(db)));
            List<String> dblist = new ArrayList<>();
            String con="";
            while ((con=dbread.readLine())!=null){
                dblist.add(con);
            }


            System.out.println("之前"+dblist.size());
            HashSet<String> hashSet = new HashSet<>(dblist);
            ArrayList<String> list = new ArrayList<>(hashSet);
            System.out.println("之后"+list.size());
            dblist.removeAll(list);
            System.out.println(dblist.get(0));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static <T> List<T> getDuplicateElements(List<T> list) {
        return list.stream()
                .collect(Collectors.toMap(e -> e, e -> 1, (a, b) -> a + b)) // 获得元素出现频率的 Map，键为元素，值为元素出现的次数
                .entrySet().stream() // Set<Entry>转换为Stream<Entry>
                .filter(entry -> entry.getValue() > 1) // 过滤出元素出现次数大于 1 的 entry
                .map(entry -> entry.getKey()) // 获得 entry 的键（重复元素）对应的 Stream
                .collect(Collectors.toList()); // 转化为 List
    }
}
