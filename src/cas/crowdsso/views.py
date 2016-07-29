from django.http import HttpResponse
from django.shortcuts import render, render_to_response

# Create your views here.
from django.template import RequestContext
from social.pipeline.mail import mail_validation
from django.contrib.auth.models import User

def home(request):
    print str(request.user)
    context = RequestContext(request,{'user': request.user})
    return render_to_response('home.html',context_instance=context)