// @Extend参数可以是状态变量。状态变量变更ui驱动刷新
@Extend(Text) function textStyles(fontSize?: number) {
  .fontSize(fontSize || 20)
  .margin(10)
  .fontColor(Color.Pink)
}

@Component /* @Component只能装饰struct声明的数据结构 */
/* 自定义组件名、类名、函数名不能和系统组件名相同 */
/* struct被@Component装饰后具备组件化的能力，一个struct只能被一个@Component装饰 */
struct HelloComponent {
  @State textContent: string = '我是自定义组件'
  @BuilderParam customComponentBuilderParam: () => void;
  @BuilderParam customSomeRender: ($$: {textContent: string}) => void = this.someRender;

  aboutToAppear() {}
  aboutToDisappear() {}

  // 自定义构建函数
  @Builder someRender($$?: {textContent: string}) {
    Text($$?.textContent || '@Builder装饰方法文案')
      .textStyles()
  }

  @Styles dividerStyles() {
    .margin(20)
    .backgroundColor(Color.Red)
  }

  // 文字被点击
  handleTextClick = () => {
    this.textContent = '我是自定义组件' + new Date().getTime()
  }

  /* build()函数定义自定义组件的声明式UI部分，相当于render */
  build() {
    Column() {
      this.customComponentBuilderParam()
      Divider().dividerStyles()
      this.someRender()
      Divider().dividerStyles()
      this.customSomeRender({textContent: '子组件自定义构建函数通过@BuilderParam定义'})
      Divider().dividerStyles()
      Text(this.textContent)
        .textStyles(26)
        .onClick(this.handleTextClick)
      Divider().dividerStyles()
      MyGlobalBuilderFunc({ paramA: this.textContent, paramB: '-' })
    }
  }
}

// 全局自定义构建函数
@Builder function MyGlobalBuilderFunc($$: { paramA: string; paramB: string }) {
  Text('全局自定义构建函数：')
    .textStyles()
  Text($$.paramA)
    .textStyles()
}

export default  HelloComponent