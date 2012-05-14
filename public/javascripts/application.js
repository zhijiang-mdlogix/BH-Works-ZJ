// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// Common function
$.fn.dataTableExt.oApi.fnReloadAjax = function ( oSettings, sNewSource, fnCallback, bStandingRedraw )
{
    if ( typeof sNewSource != 'undefined' && sNewSource != null )
    {
        oSettings.sAjaxSource = sNewSource;
    }
    this.oApi._fnProcessingDisplay( oSettings, true );
    var that = this;
    var iStart = oSettings._iDisplayStart;
    var aData = [];

    this.oApi._fnServerParams( oSettings, aData );

    oSettings.fnServerData( oSettings.sAjaxSource, aData, function(json) {
        /* Clear the old information from the table */
        that.oApi._fnClearTable( oSettings );

        /* Got the data - add it to the table */
        var aData =  (oSettings.sAjaxDataProp !== "") ?
            that.oApi._fnGetObjectDataFn( oSettings.sAjaxDataProp )( json ) : json;

        for ( var i=0 ; i<aData.length ; i++ )
        {
            that.oApi._fnAddData( oSettings, aData[i] );
        }

        oSettings.aiDisplay = oSettings.aiDisplayMaster.slice();
        that.fnDraw();

        if ( typeof bStandingRedraw != 'undefined' && bStandingRedraw === true )
        {
            oSettings._iDisplayStart = iStart;
            that.fnDraw( false );
        }

        that.oApi._fnProcessingDisplay( oSettings, false );

        /* Callback user function - for event handlers etc */
        if ( typeof fnCallback == 'function' && fnCallback != null )
        {
            fnCallback( oSettings );
        }
    }, oSettings );
}

// Live binding.
// Bind new/edit patient submit button.
$('#newpatient').live('click', function(){
    $('#form_newpatient').submit();
});

// Form related function.
function setupPatientForm(){
    // Attach validation
    $('#registrationform').validationEngine('attach', {autoHidePrompt:true, scroll:false});
    setupDataPicker();

    //setupNotification();
}

function setupDataPicker(){
    $('input.datepicker').each(function(){
        var $this = $(this), options = {};
        if($this.is('.inline')){
            var other = $('<div />', {'class': 'datepicker'});
            $this.after(other).hide();
            options.altField = $this;
            $this = other;
        }
        $this.datepicker(options);
    });
}

function setupNotification(){
    /*============
     Notifications
     ==============*/
    // air
    $('.air').mouseenter(function(){
        $(this).stop(true, true).animate({opacity: 1});
    }).mouseleave(function(){
            $(this).animate({opacity: .85});
        });

    // close notification
    $('.notification .close').click(function(e){
        $(this).closest('.notification').slideUp(function(){
            $(this).remove();
        });
        e.preventDefault();
    });
}