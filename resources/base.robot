*** Settings ***
Documentation       Star Automation
Library             FakerLibrary
Library             RequestsLibrary
Library             Collections
Library             String

Resource            services.robot
Resource            Utils.robot
Resource            login.resource
Resource            get_produtos.resource
Resource            post_produtos.resource
Resource            factories/produtos_fac.resource
Resource            put_produtos.resource
Resource            delete_produtos.resource
