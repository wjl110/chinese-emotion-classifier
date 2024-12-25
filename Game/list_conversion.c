#include <stdio.h>
#include <stdlib.h>

// 定义链表节点结构
typedef int ElemType;
typedef struct LNode {
    ElemType data;
    struct LNode *next;
} LNode, *LinkList;

// 初始化带头结点的链表
LinkList InitList() {
    LinkList L = (LinkList)malloc(sizeof(LNode));
    L->next = NULL;
    return L;
}

// 将带头结点的单链表转换为循环链表的函数
void ConvertToCircular(LinkList L) {
    LNode *p = L;
    // 遍历到链表末尾
    while (p->next != NULL) {
        p = p->next;
    }
    // 将末尾节点指向头节点,形成循环
    p->next = L;
} 