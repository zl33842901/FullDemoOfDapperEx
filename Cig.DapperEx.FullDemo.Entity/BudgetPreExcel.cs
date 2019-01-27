using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Cig.DapperEx.FullDemo.Entity
{
    public class BudgetPreExcel
    {
        [Identity]
        [Key]
        public int Id { get; set; }
        /// <summary>
        /// 总方案CODE
        /// </summary>
        public string TotalTargetCode { get; set; }
        /// <summary>
        /// 部门ID
        /// </summary>
        public string DepartID { get; set; }
        /// <summary>
        /// 方案CODE
        /// </summary>
        public string PlanCode { get; set; }
        /// <summary>
        /// 表单CODE
        /// </summary>
        public string TableCode { get; set; }
        /// <summary>
        /// 表类型   人事表处理和别的不一样。
        /// </summary>
        public EnumTableType TableType { get; set; }
        /// <summary>
        /// 详情CODE，插入本数据时生成
        /// </summary>
        public string BudgetCode { get; set; }
        /// <summary>
        /// 文件原始名称
        /// </summary>
        public string FileOriginalName { get; set; }
        /// <summary>
        /// 文件路径（站点内绝对路径）
        /// </summary>
        public string FileFullName { get; set; }
        /// <summary>
        /// 表名称  人事的这个留空就行了。
        /// </summary>
        public string SheetName { get; set; }
        public string CreateUserName { get; set; }
        public DateTime AddTime { get; set; }
        public ExcelStatusEnum Status { get; set; }
        /// <summary>
        /// 处理过程遇到的问题 或结果
        /// </summary>
        public string ProcessMsg { get; set; }
    }

    /// <summary>
    /// 预算表单类型
    /// </summary>
    [Serializable]
    public enum EnumTableType
    {
        /// <summary>
        /// 项目
        /// </summary>
        [Description("项目")]
        Project = 1,

        /// <summary>
        /// 日常
        /// </summary>
        [Description("日常")]
        Daily = 2,

        /// <summary>
        /// 人事
        /// </summary>
        [Description("人事")]
        User = 3,

        /// <summary>
        /// 集采
        /// </summary>
        [Description("集采")]
        Purchase = 4,

        /// <summary>
        /// 固资
        /// </summary>
        [Description("固资")]
        FixedAssets = 5
    }
    public enum ExcelStatusEnum : byte
    {
        [Description("等待执行")]
        Waiting = 0,
        [Description("执行中")]
        Processing = 1,
        [Description("执行完毕")]
        Complete = 2,
        [Description("出错了")]
        Error = 3,
        [Description("流程成功结束")]
        Finished = 4,
        [Description("流程出错结束")]
        FinishedError = 5
    }
}
