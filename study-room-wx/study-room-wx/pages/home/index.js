// import {listHome} from "../../api/home/index"
import pages from "../../pages";
Page({
  /**
   * 页面的初始数据
   */
  data: {
    backgroundSwiper: [
      "https://s1.ax1x.com/2023/02/01/pSBqEKU.jpg",
      "https://s1.ax1x.com/2023/02/01/pSBbxbQ.jpg",
      "https://s1.ax1x.com/2023/02/01/pSBqSEj.jpg",
      "https://s1.ax1x.com/2023/02/01/pSBbjKS.jpg",
    ],
    // 轮播配置
    indicatorDots: true,
    vertical: false,
    autoplay: true,
    interval: 2000,
    duration: 500,
    // 场地介绍
    journalismList: [
      {
        text: "学习氛围浓厚;花园式周边环境;",
      },
      {
        text: "沿街商铺方便停车;",
      },
      {
        text: "万兆WIFI，企业级路由器，百人看网课不卡;",
      },
      {
        text: "独立隔断式书桌，可充电;",
      },
      {
        text: "提前线上预约，无需抢座;",
      },
      {
        text: "护眼台灯，人体工学座椅;",
      },
      {
        text: "配备冰箱、微波炉、饮水机;",
      },
      {
        text: "提供茶水、咖啡、文具、零食等。",
      }
    ],
    matter: [
      {
        text: "1.请大家入座后首先阅读《拾伊自习室公约》。"
      },
      {
        text: "2.原则上选座订座开门都是由约座者本人使用小程序操作，程序方便简单好上手。如遇特殊情况不便自行操作时，可联系店主代为订座。"
      },
      {
        text: "3.预约到店后请直接上二楼，不要敲门，打开小程序，点击入座开门即可，随手关门入座如中途下楼如厕，请随身携带手机，以便自助开门。"
      }     
    ]
  },
  regionCheck() {
    wx.navigateTo({
      url: pages.Region
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {},
  /**
   * 生命周期函数--监听页面显示
   */
  async onShow() {
    if (typeof this.getTabBar === "function" && this.getTabBar()) {
      this.getTabBar().setData({
        //唯一标识(防止tab点击两次才生效)
        selected: 0,
      });
    }
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide() {},

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload() {},

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh() {},
});
