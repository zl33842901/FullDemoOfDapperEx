using System;
using System.Collections.Generic;
using System.Text;

namespace Cig.DapperEx.FullDemo.Entity
{
    public class SettingConfigration : ISettingConfigration
    {
        public string DefaultConnection { get; set; }

    }

    public interface ISettingConfigration
    {
        string DefaultConnection { get; }
    }
}
