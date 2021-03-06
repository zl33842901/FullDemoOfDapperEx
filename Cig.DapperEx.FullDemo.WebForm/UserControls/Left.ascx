﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Left.ascx.cs" Inherits="WebForm.UserControls.Left" %>
<!--sidebar left start-->
<aside class="sidebar sidebar-left">
    <div class="sidebar-profile">
        <div class="avatar">
            <img class="img-circle profile-image" src="/images/profile.jpg" alt="profile">
            <i class="on border-dark animated bounceIn"></i>
        </div>
        <div class="profile-body dropdown">
            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><h4>往事随风 <span class="caret"></span></h4></a>
            <small class="title">高级研发攻城师</small>
            <ul class="dropdown-menu animated fadeInRight" role="menu">
                <li class="profile-progress">
                    <h5>
                        <span>80%</span>
                        <small>资料完整度</small>
                    </h5>
                    <div class="progress progress-xs">
                        <div class="progress-bar progress-bar-primary" style="width: 80%">
                        </div>
                    </div>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="javascript:void(0);">
                        <span class="icon">
                            <i class="fa fa-user"></i>
                        </span>我的帐号
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0);">
                        <span class="icon">
                            <i class="fa fa-envelope"></i>
                        </span>信息
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0);">
                        <span class="icon">
                            <i class="fa fa-cog"></i>
                        </span>设置
                    </a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="javascript:void(0);">
                        <span class="icon">
                            <i class="fa fa-sign-out"></i>
                        </span>退出
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <nav>
        <h5 class="sidebar-header">导航信息</h5>
        <ul class="nav nav-pills nav-stacked">
            <li>
                <a href="/Home/Default" title="Dashboard">
                    <i class="fa  fa-fw fa-tachometer"></i> 主页
                </a>
            </li>
            <li class="nav-dropdown">
                <a href="#" title="查询">
                    <i class="fa  fa-fw fa-cogs"></i> 查询
                </a>
                <ul class="nav-sub">
                    <li>
                        <a href="/Home/Query" title="Buttons">
                            普通查询
                        </a>
                    </li>
                    <li>
                        <a href="/Home/PageList" title="Sliders &amp; Progress">
                            分页查询
                        </a>
                    </li>
                    <li>
                        <a href="/Home/QueryXml" title="Modals &amp; Popups">
                            XML 查询
                        </a>
                    </li>
                </ul>
            </li>
            <li class="nav-dropdown">
                <a href="#" title="Forms">
                    <i class="fa  fa-fw fa-edit"></i> 添加
                </a>
                <ul class="nav-sub">
                    <li>
                        <a href="/Home/Edit" title="添加">添加</a>
                    </li>
                </ul>
            </li>
            <li class="nav-dropdown">
                <a href="#" title="Tables">
                    <i class="fa  fa-fw fa-th-list"></i> 删除
                </a>
                <ul class="nav-sub">
                    <li>
                        <a href="/Home/PageList" title="删除">
                            删除
                        </a>
                    </li>
                </ul>
            </li>
            <li class="nav-dropdown">
                <a href="#" title="Charts">
                    <i class="fa fa-fw fa-bar-chart-o"></i> 修改
                </a>
                <ul class="nav-sub">
                    <li>
                        <a href="/Home/PageList" title="修改">
                            修改
                        </a>
                    </li>
                </ul>
            </li>
            <li class="nav-dropdown">
                <a href="#" title="Trans">
                    <i class="fa fa-fw fa-envelope-o"></i> 事务
                </a>
                <ul class="nav-sub">
                    <li>
                        <a href="/Home/Trans" title="事务">
                            事务
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="https://github.com/zl33842901/DapperEx" target="_blank" title="去查看源码">
                    <i class="fa  fa-fw fa-magic"></i> 去查看源码
                </a>
            </li>
        </ul>
    </nav>
    <h5 class="sidebar-header">帐号设置</h5>
    <div class="setting-list">
        <div class="row">
            <div class="col-xs-8">
                <label for="check1" class="control-label">共享我的状态</label>
            </div>
            <div class="col-xs-4">
                <input type="checkbox" class="js-switch" checked id="check1" />
            </div>
        </div>
        <div class="row">
            <div class="col-xs-8">
                <label for="check2" class="control-label">推送我的动态</label>
            </div>
            <div class="col-xs-4">
                <input type="checkbox" class="js-switch" id="check2" />
            </div>
        </div>
    </div>
</aside>
<!--sidebar left end-->