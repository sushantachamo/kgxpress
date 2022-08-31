<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Subscriber;
use Mail;

class SubscriberController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $subscriber = Subscriber::where('email', $request->email)->first();
        if($subscriber == null){
            $subscriber = new Subscriber;
            $subscriber->email = $request->email;
            // $subscriber->save();
            $to_email =  $request->email;
            $name = explode('@',$to_email);
            $to_name = $name[0];
            $data = array(
                'name' => $to_name,
                'email' => $to_email,
                );
            try {
                $subject = "Welcome to ".env('APP_NAME');   
                Mail::send('emails.newsletter', $data, function($message) use ($to_name, $to_email, $subject) {
                    $message->to($to_email, $to_name)
                            ->subject($subject);
                    $message->from('noreply@kgxpress.com',config('app.name'));
                });
                // throw new Exception('There seems to be a problem. Please try again in a while');
                flash(translate('You have subscribed successfully'))->success();
            }
            
            catch (Throwable $e) {
                flash(translate('There seems to be a problem. Please try again in a while'))->warning();
            }
            
        }
        else{
            flash(translate('You are  already a subscriber'))->success();
        }
        return back();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
