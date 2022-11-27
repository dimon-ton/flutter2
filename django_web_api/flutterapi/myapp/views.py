from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.response import Response
from rest_framework.decorators import api_view 
from rest_framework import status
from .serializers import TodolistSerializers
from .models import Todolist

# Create your views here.

# Get data
@api_view(['GET'])
def all_todolist(req):
    alltodolist = Todolist.objects.all()
    serializer = TodolistSerializers(alltodolist, many=True)
    return Response(serializer.data, status=status.HTTP_200_OK)

@api_view(['POST'])
def post_todolist(req):
    if req.method == 'POST':
        serializer = TodolistSerializers(data=req.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_404_NOT_FOUND)


data = [
    {
        "title":"คอมพิวเตอร์คืออะไร ?",
        "subtitle":"คอมพิวเตอร์คือ อุปกรณ์ที่ใช้สำหรับการคำนวณและทำงานอื่น ๆ",
        "img_url":"https://raw.githubusercontent.com/dimon-ton/BasicAPI/main/apple-1834328_960_720.jpg",
        "detail":"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores error similique laborum enim sunt fuga dolor officia. Exercitationem natus aut praesentium eum vero ullam, labore ea, eligendi sequi porro, officiis a provident voluptates enim! Facilis perferendis molestiae optio doloremque. A omnis, iusto similique exercitationem voluptate asperiores doloremque repellendus, nisi, corrupti placeat quod. Voluptate ab voluptatibus omnis quibusdam accusamus, similique eaque id cum repellendus exercitationem aperiam rerum ea vel repudiandae laborum voluptas, impedit accusantium dolore dolorem. Illum fuga cum autem molestiae numquam, reprehenderit, culpa minima, corrupti eius saepe voluptatem quasi tempora necessitatibus nobis vero rerum aliquam ab assumenda reiciendis veritatis temporibus."
    },
    {
        "title":"มาเขียนโปรแกรมกัน",
        "subtitle":"บทความนี้จะเริ่มต้นการเขียนโปรแกรม",
        "img_url":"https://raw.githubusercontent.com/dimon-ton/BasicAPI/main/code-1076536_960_720.jpg",
        "detail":"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores error similique laborum enim sunt fuga dolor officia. Exercitationem natus aut praesentium eum vero ullam, labore ea, eligendi sequi porro, officiis a provident voluptates enim! Facilis perferendis molestiae optio doloremque. A omnis, iusto similique exercitationem voluptate asperiores doloremque repellendus, nisi, corrupti placeat quod. Voluptate ab voluptatibus omnis quibusdam accusamus, similique eaque id cum repellendus exercitationem aperiam rerum ea vel repudiandae laborum voluptas, impedit accusantium dolore dolorem. Illum fuga cum autem molestiae numquam, reprehenderit, culpa minima, corrupti eius saepe voluptatem quasi tempora necessitatibus nobis vero rerum aliquam ab assumenda reiciendis veritatis temporibus."
    },
    {
        "title":"Flutter คือ ?",
        "subtitle":"Tools สำหรับการออกแบบ UI ของ Google",
        "img_url":"https://raw.githubusercontent.com/dimon-ton/BasicAPI/main/1_AkuZzTEw-WYMRzu8fIobOg.png",
        "detail":"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores error similique laborum enim sunt fuga dolor officia. Exercitationem natus aut praesentium eum vero ullam, labore ea, eligendi sequi porro, officiis a provident voluptates enim! Facilis perferendis molestiae optio doloremque. A omnis, iusto similique exercitationem voluptate asperiores doloremque repellendus, nisi, corrupti placeat quod. Voluptate ab voluptatibus omnis quibusdam accusamus, similique eaque id cum repellendus exercitationem aperiam rerum ea vel repudiandae laborum voluptas, impedit accusantium dolore dolorem. Illum fuga cum autem molestiae numquam, reprehenderit, culpa minima, corrupti eius saepe voluptatem quasi tempora necessitatibus nobis vero rerum aliquam ab assumenda reiciendis veritatis temporibus."
    }

]

def Home(req):
    return JsonResponse(data=data, safe=False, json_dumps_params={'ensure_ascii':False})