package com;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

@WebServlet(name = "/ServletAddProduct")
public class ServletAddProduct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        MysqlConn mysqlConn=new MysqlConn(response,"/Admin/add_product.jsp");
        String ptid=null;
        String pname =null;
        String pdescription_word=null ;
        String pdescription_img =null;
        String pprice=null;
        String pprice_v =null;
        String  pnum=null;

        //判断上传表单是否为multipart/form-data类型
        if(ServletFileUpload.isMultipartContent(request))
        {

            try {
                //1. 创建DiskFileItemFactory对象，设置缓冲区大小和临时文件目录
                DiskFileItemFactory factory = new DiskFileItemFactory();
                //System.out.println(System.getProperty("java.io.tmpdir"));//默认临时文件夹

                //2. 创建ServletFileUpload对象，并设置上传文件的大小限制。
                ServletFileUpload sfu = new ServletFileUpload(factory);
                sfu.setSizeMax(10*1024*1024);//以byte为单位不能超过10M  1024byte = 1kb  1024kb=1M 1024M = 1G
                sfu.setHeaderEncoding("utf-8");

                //3. 调用ServletFileUpload.parseRequest方法解析request对象，得到一个保存了所有上传内容的List对象。
                List<FileItem> fileItemList = sfu.parseRequest(request);
                Iterator<FileItem> fileItems = fileItemList.iterator();

                //4. 遍历list，每迭代一个FileItem对象，调用其isFormField方法判断是否是上传文件
                while(fileItems.hasNext())
                {
                    FileItem fileItem = fileItems.next();
                    //普通表单元素
                    if(fileItem.isFormField())//判断表单项是普通字段还是上传项
                    {
                        String name = fileItem.getFieldName();//name属性值
                        String value = fileItem.getString("utf-8");//name对应的value值
                        System.out.println(name + " = "+value);
                        switch (name)
                        {
                            case "Pname":pname=value; System.out.print(pname);break;
                            case "Pdescription_word":pdescription_word=value;break;
                            case "Pprice":pprice=value;break;
                            case "Pprice_v":pprice_v=value;break;
                            case "Pnum":pnum=value;break;
                            case "PTid":ptid=value;break;
                        }
                    }
                    //<input type="file">的上传文件的元素
                    else
                    {
                        String fileName = fileItem.getName();//文件名称
                        System.out.println("原文件名：" + fileName);//Koala.jpg

                        String suffix = fileName.substring(fileName.lastIndexOf('.'));
                        System.out.println("扩展名：" + suffix);//.jpg

                        //新文件名（唯一）
                        String newFileName = new Date().getTime() + suffix;
                        System.out.println("新文件名：" + newFileName);//image\1478509873038.jpg

                        //5. 调用FileItem的write()方法，写入文件
                        File file = new File(request.getServletContext().getRealPath("image")+"\\"+newFileName);


                        fileItem.write(file);

                        //6. 调用FileItem的delete()方法，删除临时文件
                        fileItem.delete();

                        request.setAttribute("image_name",fileName);
                        request.setAttribute("image_path","image/"+newFileName);
                        pdescription_img="image/"+newFileName;
                        /*
                        request.getRequestDispatcher("index.jsp").forward(request, response);
*/                    }
                }

            } catch (FileUploadException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }


        }

        try {
            String sql2="select * from test.type where Tid="+ptid;
            ResultSet rstemp=mysqlConn.st.executeQuery(sql2);
            System.out.println(sql2);
            String ptname=null;
            if(rstemp.next()){
                ptname=rstemp.getString("Tname");
            }

            System.out.println(ptname);
            String sql = "SELECT Pid\r\n" +
                    "FROM test.product\r\n" +
                    "WHERE Pid='"+pname +"'";
            System.out.print(sql);
            ResultSet rs = mysqlConn.st.executeQuery(sql);
            if (rs.next()) {
                response.getWriter().print("<script> alert(\"ERROR: Duplicate username!\");" +
                        "window.location.href='/Admin/product_list.jsp';</script>");
                return;
            }
            String sql1 = "insert into test.product\r\n" +
                    "(PTid,Pdescription_word,Pdescription_img,Pname," +
                    "Pprice,Pprice_v,Pnum,PTname)"+"values ("+ptid+",'"+
                    pdescription_word+"','"+pdescription_img+"','"+pname+"',"+pprice+","+pprice_v+","+pnum+",'"+ptname+"')";

            System.out.print(sql1);
            mysqlConn.st.executeUpdate(sql1);
            request.getRequestDispatcher("/Admin/product_list.jsp").forward(request,response);
        } catch (Exception e) {
            response.getWriter().print("<script> alert(\"ERROR: Insert error!\"); </script>");
            e.printStackTrace();
        }

    }
}
