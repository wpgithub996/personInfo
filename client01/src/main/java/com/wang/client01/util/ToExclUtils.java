package com.wang.client01.util;

import com.wang.client01.pojo.PersonInfo;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;

import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.util.List;

/***********************************
 * @ClassName: ToExclUtils
 * @Description: TODO
 * @author: tangh
 * @createdAt: 2019年01月29日 10:51
 ***********************************/

public class ToExclUtils {
    public ToExclUtils() {

    }


    public static HSSFCell getCell(HSSFSheet sheet, int row, int col) {

        HSSFRow sheetRow = sheet.getRow(row);

        if (sheetRow == null){

            sheetRow = sheet.createRow(row);

        }

        HSSFCell cell = sheetRow.getCell(col);

        if (cell == null){

            cell = sheetRow.createCell(col);

        }

        return cell;

    }


    public static void setText(HSSFCell cell, String text) {

        cell.setCellType(CellType.STRING);

        cell.setCellValue(text);

    }


    public static void toExcel(HttpServletResponse response, List<String> titles, List<PersonInfo> list) throws Exception {

        HSSFWorkbook wb = new HSSFWorkbook(); // 定义一个新的工作簿

        HSSFSheet sheet = wb.createSheet("人员信息"); // 创建第一个Sheet页

        // 第四步，创建单元格，并设置值表头 设置表头居中

        HSSFCellStyle style = wb.createCellStyle();

        style.setAlignment(HorizontalAlignment.CENTER); // 创建一个居中格式

        HSSFRow row = sheet.createRow(0); // 创建一个行

        HSSFCell cell = row.createCell(0); // 创建一个单元格 第1列

        // cell.setCellValue(new Date()); // 给单元格设置值

        for (int i = 0; i < titles.size(); i++){ // 设置标题

            String title = titles.get(i);

            cell = getCell(sheet, 0, i);

            setText(cell, title);

            cell.setCellStyle(style);

        }

        for (int i = 0; i < list.size(); i++){
            HSSFRow rows = sheet.createRow(i + 1);

            rows.createCell(0).setCellValue(list.get(i).getIdNum());
            rows.createCell(1).setCellValue(list.get(i).getName());
            rows.createCell(2).setCellValue(list.get(i).getGender());
            rows.createCell(7).setCellValue(list.get(i).getAddress());
            rows.createCell(3).setCellValue(list.get(i).getIdCard());
            rows.createCell(4).setCellValue(list.get(i).getAge());
            rows.createCell(5).setCellValue(list.get(i).getPhone());
            rows.createCell(6).setCellValue(list.get(i).getCity());
            rows.createCell(8).setCellValue(list.get(i).getIsOut());
            rows.createCell(9).setCellValue(list.get(i).getIsHost());

        }
        String fileName = new String("人员信息表.xls".getBytes(), "ISO8859-1");
        response.setContentType("application/octet-stream;charset=ISO8859-1");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
        response.addHeader("Pargam", "no-cache");
        response.addHeader("Cache-Control", "no-cache");
        OutputStream os = response.getOutputStream();
//        FileOutputStream fileOut = new FileOutputStream("D://成员信息表.xlsx");

        wb.write(os);
        os.flush();
        os.close();
        wb.close();
    }

}