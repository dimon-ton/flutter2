from django.urls import path
from .views import *

urlpatterns = [
    path('', Home),
    path('api/all-todolist/', all_todolist),
    path('api/post-todolist', post_todolist),
    path('api/update-todolist/<int:TID>', update_todolist),
    path('api/delete-todolist/<int:TID>', delete_todolist),
    path('api/newuser', register_newuser), # POST request doesn't need to put slash behind.
    path('api/authenticate', authenticate_app), # login to app
]