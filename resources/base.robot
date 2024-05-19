*** Settings ***
Documentation       Star Automation
Library             FakerLibrary

Resource            services.robot
Resource            Utils.robot
Resource            login.resource
Resource            get_produtos.resource
Resource            post_produtos.resource
Resource            factories/produtos_fac.resource
Resource            put_produtos.resource