<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebForm.Index" %>
<%@ Register src="UserControls/Config.ascx" tagname="Config" tagprefix="uc1" %>
<%@ Register src="UserControls/FootInclude.ascx" tagname="FootInclude" tagprefix="uc1" %>
<%@ Register src="UserControls/Header.ascx" tagname="Header" tagprefix="uc1" %>
<%@ Register src="UserControls/HeadInclude.ascx" tagname="HeadInclude" tagprefix="uc1" %>
<%@ Register src="UserControls/Left.ascx" tagname="Left" tagprefix="uc1" %>
<%@ Register src="UserControls/SideBar.ascx" tagname="SideBar" tagprefix="uc1" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>DapperEx 完整DEMO</title>
    <uc1:HeadInclude runat="server" />
    <script type="text/javascript">
        function go(pageIndex) {
            if (pageIndex == null)
                pageIndex = 1;
            var l = '/Index.aspx?dictid=' + $('#SelOption').val() + '&deleted=' + $('#SelDeleted').val() + '&keyword=' + $('#TxtKeyword').val() + "&page=" + pageIndex;
            location = l;
        }
    </script>
</head>
<body>
    <section id="main-wrapper" class="theme-default">
        <uc1:Header runat="server" />
        <uc1:Left runat="server" />
        <!--main content start-->
        <section class="main-content-wrapper">
            <div class="pageheader">
                <h1>DapperEx 查询测试</h1>
                <div class="breadcrumb-wrapper hidden-xs">
                    <span class="label">您的位置:</span>
                    <ol class="breadcrumb">
                        <li>
                            <a href="javascript:;">DapperEx 完整DEMO</a>
                        </li>
                        <li>Tables</li>
                        <li class="active">数据查询</li>
                    </ol>
                </div>
            </div>
            <section id="main-content" class="animated fadeInUp">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">分页查询</h3>
                                <div class="actions pull-right">
                                    <i class="fa fa-expand"></i>
                                    <i class="fa fa-chevron-down"></i>
                                    <i class="fa fa-times"></i>
                                </div>
                            </div>

                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <select class="form-control input-sm" id="SelOption" style="margin-top:5px;">
                                                <option value="0">Dict类型</option>
                                                <asp:Repeater runat="server" ID="RptDict">
                                                    <ItemTemplate>
                                                        <option value="<%#Eval("Key") %>" <%#Eval("Key").ToString() == dictId.ToString()?"selected":string.Empty %>><%#Eval("Value") %></option>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <select class="form-control input-sm" id="SelDeleted" style="margin-top:5px;">
                                                <option value="0">是否删除</option>
                                                <option value="1" <%= deleted==true ? "selected" : string.Empty %>>True</option>
                                                <option value="2" <%= deleted==false ? "selected" : string.Empty %>>False</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <input class="form-control input-sm" id="TxtKeyword" value="<%=keyword %>" style="margin-top:5px;" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <input type="button" class="form-control" onclick="go();" style="margin-top:5px;" value="查询" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="panel-body">
                                <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th>名称</th>
                                            <th>Id</th>
                                            <th>创建时间</th>
                                            <th>DictID</th>
                                            <th>删除状态</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater runat="server" ID="RptContent">
                                            <ItemTemplate>
                                                <tr>
                                                <td><%#Eval("title") %></td>
                                                <td><%#Eval("id") %></td>
                                                <td><%#Eval("CreateTime","{0:yyyy-MM-dd HH:mm}") %></td>
                                                <td><%#Eval("DictID") %></td>
                                                <td><%#Eval("Deleted") %></td>
                                                <td>
                                                    <a href="javascript:;" onclick="alert('暂不支持');">编辑</a>
                                                    <a href="javascript:;" onclick="DelLogic(<%#Eval("id") %>);">删除</a>
                                                    <a href="javascript:;" onclick="DelPhysic(<%#Eval("id") %>);">物理删除</a>
                                                </td>
                                            </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>
                            <div class="btn-toolbar" role="toolbar">
                                <div class="btn-group" style="margin-left:20px;margin-bottom:30px;">
                                    <asp:Repeater runat="server" ID="RptPager">
                                        <ItemTemplate>
                                            <button type="button" onclick="go(<%#Container.DataItem %>);" class="btn btn-<%#(int)Container.DataItem==page?"primary":"default" %>"><%#Container.DataItem %></button>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </section>
        </section>
        <!--main content end-->
    </section>
    <uc1:SideBar runat="server" />
    <uc1:Config runat="server" />
    <uc1:FootInclude runat="server" />
    <script>
        $(document).ready(function () {
            app.dateRangePicker();
            app.chartJs();
            app.weather();
            app.spinStart();
            app.spinStop();
        });
        function DelLogic(id) {
            $.post("/h.ashx?a=DelLogic&id=" + id, {}, function (data, status) {
                data = JSON.parse(data);
                if (data.Success) {
                    alert("操作成功！DapperEx的返回值为 " + data.Result);
                    go(1);
                }
            });
        }
        function DelPhysic(id) {
            $.post("/h.ashx?a=DelPhysic&id=" + id, {}, function (data, status) {
                data = JSON.parse(data);
                if (data.Success) {
                    alert("操作成功！DapperEx的返回值为 " + data.Result);
                    go(1);
                }
            });
        }
    </script>

</body>
</html>