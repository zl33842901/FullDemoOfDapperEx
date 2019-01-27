<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="WebForm.UserControls.Header" %>
<header id="header">
    <!--logo start-->
    <div class="brand">
        <a href="/" class="logo">
            <i class="icon-layers"></i>
            <span>CIG</span>信息技术中心
        </a>
    </div>
    <!--logo end-->
    <ul class="nav navbar-nav navbar-left">
        <li class="toggle-navigation toggle-left">
            <button class="sidebar-toggle" id="toggle-left">
                <i class="fa fa-bars"></i>
            </button>
        </li>
        <li class="toggle-profile hidden-xs">
            <button type="button" class="btn btn-default" id="toggle-profile">
                <i class="icon-user"></i>
            </button>
        </li>
        <li class="hidden-xs hidden-sm">
            <input type="text" class="search" placeholder="搜索...">
            <button type="submit" class="btn btn-sm btn-search">
                <i class="fa fa-search"></i>
            </button>
        </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
        <li class="dropdown profile hidden-xs">
            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                <span class="meta">
                    <span class="avatar">
                        <img src="/images/profile.jpg" class="img-circle" alt="">
                    </span>
                    <span class="text">往事随风</span>
                    <span class="caret"></span>
                </span>
            </a>
            <ul class="dropdown-menu animated fadeInRight" role="menu">
                <li>
                    <span class="arrow top"></span>
                    <h5>
                        <span>80%</span>
                        <small class="text-muted">资料完整性</small>
                    </h5>
                    <div class="progress progress-xs">
                        <div class="progress-bar progress-bar" style="width: 80%">
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
        </li>
        <li class="toggle-fullscreen hidden-xs">
            <button type="button" class="btn btn-default expand" id="toggle-fullscreen">
                <i class="fa fa-expand"></i>
            </button>
        </li>
        <li class="toggle-navigation toggle-right">
            <button class="sidebar-toggle" id="toggle-right">
                <i class="fa fa-indent"></i>
            </button>
        </li>
    </ul>
</header>