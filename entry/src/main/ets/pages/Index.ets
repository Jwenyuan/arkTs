import router from '@ohos.router';

@Entry
@Component
struct Index {

  // 页面每次显示时（路由及应用进入前台）
  onPageShow() {
    console.log('onPageShow')
  }
  // 页面每次隐藏时（路由及应用进入后台）
  onPageHide() {
    console.log('onPageHide')
  }

  // 用户点击返回按钮时
  onBackPress() {
    console.log('onBackPress')
  }

  handleBtnClick () {
    console.log('点击')
    router.pushUrl({url: 'pages/arkBasicGrammar'})
  }

  build() {
    // 容器组件： Row、Column、Stack、Grid、List等
    Row() {
      Column() {
        Button('1.1 ark基础语法')
          .fontSize(24)
          .onClick(this.handleBtnClick.bind(this))
      }.width('100%')
    }.height('100%')
  }
}
