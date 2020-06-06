<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>数据统计</title>
    <script src="js/echarts.min.js"></script>
    <script src="js/jquery.js"></script>
  </head>
  <body>
    <div id="main" style="width: 1400px;height:700px;margin: auto auto"></div>
    <script type="text/javascript">
      // 基于准备好的dom，初始化echarts实例
      var myChart = echarts.init(document.getElementById('main'));

      // 指定图表的配置项和数据
      var option = {
        title : {
          text: '人员外出统计',
          x:'center'
        },
        tooltip : {
          trigger: 'item',
          formatter: "{b} <br/>{c} : {d} %"      //a 系列名称，b 数据项名称，c 数值，d 百分比
        },
        legend: {
          orient : 'vertical',
          x : 'left',
          data:["外出","本地"]
        },
        toolbox: {
          show : true,
          feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {
              show: true,
              type: ['pie', 'funnel'],
              option: {
                funnel: {
                  x: '25%',
                  width: '50%',
                  funnelAlign: 'left',
                  max: 1548
                }
              }
            },
            restore : {show: true},
            saveAsImage : {show: true}
          }
        },
        calculable : true,
        series : [
          {
            name:'人员外出统计',
            type:'pie',
            radius : '55%',//饼图的半径大小
            center: ['50%', '60%'],//饼图的位置
            data:[]
          }
        ]
      };

      $(function(){
        var servicedata=[];
        $.ajax({
          type: "POST",
          url:'https://www.maxinyu.wang/isOut',
          dataType: 'json',
          contentType: "application/x-www-form-urlencoded; charset=UTF-8",
          success: function (data) {
            if(data){
              var obj = eval(data);
              for(var i=0;i<obj.length;i++){
                var sum = new Object();
                sum.name=data[i].inout;
                sum.value=data[i].num;
                servicedata[i]=sum;
              }

            }
            myChart.setOption({
              series: [{
                // 根据名字对应到相应的系列
                name: '人员外出统计',
                data: servicedata
              }]
            });
          }
        })
      });

      // 使用刚指定的配置项和数据显示图表。
      myChart.setOption(option);
    </script>
  </body>
</html>
