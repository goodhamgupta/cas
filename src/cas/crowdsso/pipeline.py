
import json


from django.shortcuts import redirect

from django.contrib import messages
from rest_framework import request


def begin(strategy,backend,request,details,*args,**kwargs):
    print strategy
    print "*************"
    print backend
    print "*************"
    print request




def test(backend,user,response,*args,**kwargs):
    data_json = response
    print data_json
    try:
        if 'domain' in data_json:
            if data_json['domain'] == "zopper.com" :
                access_token = data_json["access_token"]
        else:
            print "NO DOMAIN"
            return redirect('/crowdsso/home/')
    except Exception as e:
        print str(e)
    # if data_json["domain"] ==
