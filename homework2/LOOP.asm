
;LOOP.c每个语句及其反汇编码对应
;LOOP.o:     file format pe-x86-64
#include <stdio.h>

int main() {
   0:	55                   	push   %rbp             ; 保存旧的基指针
   1:	48 89 e5             	mov    %rsp,%rbp        ; 设置新的基指针
   4:	48 83 ec 30          	sub    $0x30,%rsp       ; 为局部变量分配栈空间

    char letter = 'A';
   8:	e8 00 00 00 00       	callq  d <main+0xd>     ; 函数调用（可能是初始化操作）

    d:	c6 45 ff 41         movb   $0x41,-0x1(%rbp) ; 将'A'的ASCII码（0x41）存储在letter变量中
    int count = 0;
  11:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)  ; 将0存储在count变量中

    for (int i = 0; i < 26; i++) {
  18:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)  ; 初始化循环变量i为0
  1f:	eb 35                	jmp    56 <main+0x56>   ; 跳转到循环继续标签

        printf("%c", letter++);
  21:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax  ; 将letter的值加载到eax
  25:	89 c2                	mov    %eax,%edx        ; 复制eax到edx
  27:	83 c2 01             	add    $0x1,%edx        ; 将letter的值加1
  2a:	88 55 ff             	mov    %dl,-0x1(%rbp)   ; 将新的值存储回letter
  2d:	0f be c0             	movsbl %al,%eax         ; 将letter的值符号扩展到eax
  30:	89 c1                	mov    %eax,%ecx        ; 准备printf的第一个参数
  32:	e8 00 00 00 00       	callq  37 <main+0x37>   ; 调用printf函数

        if (++count == 13) {
  37:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)  ; 计数器加1
  3b:	83 7d f8 0d          	cmpl   $0xd,-0x8(%rbp)  ; 比较计数器和13
  3f:	75 11                	jne    52 <main+0x52>   ; 如果不相等，跳过下面的printf
            printf("\n"); 
  41:	b9 0a 00 00 00       	mov    $0xa,%ecx        ; 准备printf的参数（换行符的ASCII码）
  46:	e8 00 00 00 00       	callq  4b <main+0x4b>   ; 调用printf函数
            count = 0;
  4b:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)  ; 将0存储在count变量中
        }
  52:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)  ; 循环变量i加1
  56:	83 7d f4 19          	cmpl   $0x19,-0xc(%rbp) ; 比较循环变量i和26
  5a:	7e c5                	jle    21 <main+0x21>   ; 如果i小于26，继续循环

    }

    return 0;
  5c:	b8 00 00 00 00       	mov    $0x0,%eax       ; 设置返回值为0
  61:	48 83 c4 30          	add    $0x30,%rsp      ; 释放栈空间
  65:	5d                   	pop    %rbp            ; 恢复旧的基指针
  66:	c3                   	retq                   ; 返回到调用者

  67:	90                   	nop                    ; 无操作指令（可能是填充或对齐）
  68:	90                   	nop
  69:	90                   	nop
  6a:	90                   	nop
  6b:	90                   	nop
  6c:	90                   	nop
  6d:	90                   	nop
  6e:	90                   	nop
  6f:	90                   	nop