@Component
struct HelloComponent2 {
  @State btnText: string = '一个按钮'
  // 组件即将出现时（创建自定义组件新实例后，执行build()前）
  aboutToAppear() {
    console.log(this.btnText + 'aboutToAppear')
  }
  // 组件销毁前，不允许在函数内改变状态变量
  aboutToDisappear() {
    console.log(this.btnText + 'aboutToDisappear')
  }

  build() {
    Button(this.btnText)
  }
}

export default  HelloComponent2