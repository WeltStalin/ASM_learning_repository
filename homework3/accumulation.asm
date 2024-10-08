;每个语句及其反汇编码对应
accumulation.o:     file format pe-x86-64


Disassembly of section .text:

0000000000000000 <main>:
#include <stdio.h>

int main() {
  0:	55                   	push   %rbp          ; 推送旧的基指针到栈上
  1:	48 89 e5             	mov    %rsp,%rbp      ; 将栈指针移到基指针，设置新的栈帧
  4:	48 83 ec 30          	sub    $0x30,%rsp    ; 为局部变量分配栈空间

  8:	e8 00 00 00 00       	callq  d <main+0xd>   ; 调用函数（这里是为了调整栈指针）

    int sum = 0;
  d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp) ; 将0移动到sum变量的位置（sum初始化为0）

   for (int i = 1; i <= 100; i++) {
  14:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)  ; 将1移动到i变量的位置（i初始化为1）
  1b:	eb 0a                	jmp    27 <main+0x27>   ; 跳转到循环继续的部分

        sum += i;
  1d:	8b 45 f8             	mov    -0x8(%rbp),%eax  ; 将i的值移动到eax寄存器
  20:	01 45 fc             	add    %eax,-0x4(%rbp)  ; 将eax的值加到sum上

    for (int i = 1; i <= 100; i++) {
  23:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)  ; 将i的值加1
  27:	83 7d f8 64          	cmpl   $0x64,-0x8(%rbp) ; 比较i和100
  2b:	7e f0                	jle    1d <main+0x1d>   ; 如果i小于等于100，跳转到循环开始

    }

    printf("累加和：%d\n", sum);
  2d:	8b 45 fc             	mov    -0x4(%rbp),%eax  ; 将sum的值移动到eax寄存器
  30:	89 c2                	mov    %eax,%edx       ; 将eax的值移动到edx寄存器（为printf准备）
  32:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx  ; 加载格式化字符串的地址到rcx寄存器
  39:	e8 00 00 00 00       	callq  3e <main+0x3e>   ; 调用printf函数

    //输入输出
    int number = 0;
  3e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)  ; 将0移动到number变量的位置（number初始化为0）
    printf("请输入数字（1~100）：");
  45:	48 8d 0d 0c 00 00 00 	lea    0xc(%rip),%rcx  ; 加载格式化字符串的地址到rcx寄存器
  4c:	e8 00 00 00 00       	callq  51 <main+0x51>   ; 调用printf函数
    scanf("%d", &number);
  51:	48 8d 45 f4          	lea    -0xc(%rbp),%rax  ; 加载number变量的地址到rax寄存器
  55:	48 89 c2             	mov    %rax,%rdx       ; 将rax的值移动到rdx寄存器（为scanf准备）
  58:	48 8d 0d 22 00 00 00 	lea    0x22(%rip),%rcx  ; 加载格式化字符串的地址到rcx寄存器
  5f:	e8 00 00 00 00       	callq  64 <main+0x64>   ; 调用scanf函数

    printf("十进制输出：%d\n", number);
  64:	8b 45 f4             	mov    -0xc(%rbp),%eax  ; 将number的值移动到eax寄存器
  67:	89 c2                	mov    %eax,%edx       ; 将eax的值移动到edx寄存器（为printf准备）
  69:	48 8d 0d 25 00 00 00 	lea    0x25(%rip),%rcx  ; 加载格式化字符串的地址到rcx寄存器
  70:	e8 00 00 00 00       	callq  75 <main+0x75>   ; 调用printf函数

    return 0;
  75:	b8 00 00 00 00       	mov    $0x0,%eax       ; 将0移动到eax寄存器（函数返回值）
  7a:	48 83 c4 30          	add    $0x30,%rsp      ; 释放栈空间
  7e:	5d                   	pop    %rbp            ; 弹出基指针
  7f:	c3                   	retq                   ; 返回到调用者
}  
