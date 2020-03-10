$(function () {
  var myChart = echarts.init(document.getElementById('echart'), 'dark');

  // 指定图表的配置项和数据
  var option = {
    title: {
      text: '',
      subtext: ''
    },
    tooltip: {
      trigger: 'axis'
    },
    legend: {
      data: ['成交量', '订单量']
    },
    toolbox: {
      show: false,
      feature: {
        magicType: { show: true, type: ['stack', 'tiled'] },
        saveAsImage: { show: true }
      }
    },
    xAxis: {
      type: 'category',
      boundaryGap: false,
      data: Orderdata.column
    },
    yAxis: {},
    grid: [{
      left: 'left',
      top: 'top',
      right: '10',
      bottom: 30
    }],
    series: [{
      name: '成交量',
      type: 'line',
      smooth: true,
      lineStyle: {
        normal: {
          width: 1.5
        }
      },
      data: Orderdata.paydata
    },
    {
      name: '订单量',
      type: 'line',
      smooth: true,
      lineStyle: {
        normal: {
          width: 1.5
        }
      },
      data: Orderdata.createdata
    }]
  };

  // 使用刚指定的配置项和数据显示图表。
  myChart.setOption(option);

  //动态添加数据，可以通过Ajax获取数据然后填充
  setInterval(function () {
    Orderdata.column.push((new Date()).toLocaleTimeString().replace(/^\D*/, ''));
    var amount = Math.floor(Math.random() * 200) + 20;
    Orderdata.createdata.push(amount);
    Orderdata.paydata.push(Math.floor(Math.random() * amount) + 1);

    //按自己需求可以取消这个限制
    if (Orderdata.column.length >= 20) {
      //移除最开始的一条数据
      Orderdata.column.shift();
      Orderdata.paydata.shift();
      Orderdata.createdata.shift();
    }
    myChart.setOption({
      xAxis: {
        data: Orderdata.column
      },
      series: [{
        name: '成交量',
        data: Orderdata.paydata
      },
      {
        name: '订单量',
        data: Orderdata.createdata
      }]
    });
    if ($("#echart").width() != $("#echart canvas").width() && $("#echart canvas").width() < $("#echart").width()) {
      myChart.resize();
    }
  }, 2000);
  $(window).resize(function () {
    myChart.resize();
  });
})