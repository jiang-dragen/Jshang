<%@ page import="java.io.Console" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍展示页面</title>

    <%
        pageContext.setAttribute("PATH",request.getContextPath());

    %>


    <%@ include file="/WEB-INF/common/head.jsp"%>

    <script type="text/javascript">
        $(function (){



            $('#myModal').modal({backdrop:'static', keyboard:false,show:false});

            $(document).on("click","#delete",function (){
                let bookName = $(this).parents("tr").find("td:eq(1)").text();
                let bookDetail = $(this).parents("tr").find("td:eq(3)").text();
                let bookId = $(this).parents("tr").find("td:eq(0)").text();

                $("#bookName").attr("value",bookName);

                $("#bookDetail").attr("value",bookDetail);
                $("#isDel").click(function (){

                    let url = "${PATH}/book/deleteBook/"+bookId;
                    location.href = url;

                    alert("删除成功");
                })

            })


                /*$.ajax({
                    url:"${PATH}/book/deleteBook",
                    type:"DELETE",
                    data:"bookId="+bookId,
                    success:function (){
                        let url = "${PATH}/book/allBooks";
                        location.href = url;
                    }
                })*/


            /*$("#delete").each(function (){
                $(this).bind("click",function (){
                    let bookName = $(this).attr("bookName");
                    let detail = $(this).attr("bookDetail");

                    $('#myModal').modal({backdrop:'static', keyboard:false,show:false});

                    $("#bookName").attr("value",bookName);

                    $("#bookDetail").attr("value",detail);

                })
            })*/
             /* $("#delete").click(function (){
                  let bookName = $(this).attr("bookName");
                  let detail = $(this).attr("bookDetail");

                  $('#myModal').modal({backdrop:'static', keyboard:false,show:false});

                  $("#bookName").attr("value",bookName);

                  $("#bookDetail").attr("value",detail);*/

                /*$.ajax({
                    url : "${PATH}/book/toUpdate?bookId"+bookId,
                    success:function (books){
                        /!*$("#myModal").module('hide')*!/
                        $("#bookName").attr("value","wwwwww")
                    }
                })*/

            });
        /*});*/
    </script>

</head>
<body>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">删除信息</h4>
            </div>
            <div class="modal-body">
                <div class="form-group" style="font-size: 15px">
                    <label for="bookName">bookName</label>
                    <input name="bookName" type="text" class="form-control"
                           id="bookName" placeholder="bookName"/>
                </div>
                <div class="form-group" style="font-size: 15px">
                    <label for="bookDetail">bookDetail</label>
                    <input name="bookDetail" type="text" class="form-control"
                           id="bookDetail" placeholder="bookDetail"/>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="isDel">确定删除</button>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>书籍显示----------显示所有图书</small>
                </h1>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary glyphicon glyphicon-pencil"  href="${pageContext.request.contextPath}/book/toAddBook">新增</a>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>书籍编号</th>
                    <th>书籍名称</th>
                    <th>书籍数量</th>
                    <th>书籍描述</th>
                    <th>操作</th>
                </tr>
                </thead>
                <%--  <%=
                      request.getAttribute("list")
                  %>--%>
                <tbody>
                <c:forEach var="book" items="${pageInfo.list}" varStatus="i">
                    <tr>
                        <td>${book.bookID}</td>
                        <td>${book.bookName}</td>
                        <td>${book.bookCounts}</td>
                        <td>${book.detail}</td>
                        <td>
                            <div class="row">
                                <div class="col-md-12 column">
                                    <a class="btn btn-primary glyphicon glyphicon-pencil" href="${pageContext.request.contextPath}/book/toUpdate/${book.bookID}">修改</a>
                                    <%--<a data-target="#myModal" class="btn btn btn-danger glyphicon glyphicon-trash" href="${pageContext.request.contextPath}/book/deleteBook/${book.bookID}" id="delete">删除</a>--%>
                                    <!-- Button trigger modal -->
                                    <button class="btn btn btn-danger glyphicon glyphicon-trash" data-toggle="modal" data-target="#myModal" id="delete" bookName="${book.bookName}" bookDetail="${book.detail}">
                                        删除
                                    </button>
                                </div>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div class="row">
        <!--分页文字信息  -->
        <div class="col-md-6">当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
            页,总 ${pageInfo.total } 条记录</div>
        <!-- 分页条信息 -->
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${PATH}/book/allBooks?pn=1">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage }">
                        <li><a href="${PATH}/book/allBooks?pn=${pageInfo.pageNum-1}"
                               aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                        </a></li>
                    </c:if>


                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                        <c:if test="${page_Num == pageInfo.pageNum}">
                            <li class="active"><a href="#">${page_Num}</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.pageNum }">
                            <li><a href="${PATH}/book/allBooks?pn=${page_Num}">${page_Num}</a></li>
                        </c:if>

                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage }">
                        <li><a href="${PATH}/book/allBooks?pn=${pageInfo.pageNum+1 }"
                               aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                        </a></li>
                    </c:if>
                    <li><a href="${PATH}/book/allBooks?pn=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>


</body>
</html>
