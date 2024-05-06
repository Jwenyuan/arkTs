import router from '@ohos.router'
import HelloComponent from './helloComponent'
import HelloComponent2 from './HelloComponent2'

@Styles function GlobalStyles() {
  .margin(20)
}
/* @Entry装饰的组件将作为UI页面的入口，单页面最多可以使用一个 */
// 可选LocalStorage参数
@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State num: number = 1

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

  handleHover = () => {
    console.log('q==>> aa')
  }

  handleBtnClick () {
    if (this.message === 'Hello World') {
      this.message = 'Hello ArkTS'
    } else {
      this.message = 'Hello World'
    }
  }
  // 函数使用bind调用
  func () {
    this.message = 'hi'
  }

  @Builder componentBuilder() {
    Text('父组件内的自定义构建函数,builderParam传入')
  }

  build() {
    // 容器组件： Row、Column、Stack、Grid、List等
    Row() {
      Column() {
        Row() {
          Button('back')
            .onClick(() => {
              router.back()
            })
          Image('https://img1.baidu.com/it/u=1965663592,580944689&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1713546000&t=c69d4564d16a3b0b57e5726b3475d7f6')
            .width(180)
            .GlobalStyles()
        }
        Text(this.message + ' 😁')
          .onClick(this.handleHover)
        Button('点击切换上方文案')
          .fontSize(24)
          .GlobalStyles()
          .onClick(this.handleBtnClick.bind(this))
        Button('多态样式')
          .stateStyles({
            focused: {
              .backgroundColor(Color.Pink)
            },
            pressed: {
              .backgroundColor(Color.Orange)
            }
          })

        // 自定义组件
        HelloComponent({ textContent: '自定义组件传入文案1', customComponentBuilderParam: this.componentBuilder })
        // HelloComponent({ textContent: '自定义组件传入文案2' })
        // 自定义组件链式设置样式时，相当于在组件外套了一个不可见的容器组件
        HelloComponent2({btnText: '点击切换下方按钮'})
          .width(200)
          .backgroundColor(Color.Red)
          .margin(20)
          .onClick(() => {this.num += 1})
        if (this.num % 2) {
          HelloComponent2({ btnText: '第一个按钮' })
        } else {
          HelloComponent2({ btnText: '第二个按钮' })
        }
      }.width('100%')
    }.height('100%')
  }
}
