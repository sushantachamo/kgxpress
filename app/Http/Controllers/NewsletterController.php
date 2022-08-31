<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Subscriber;
use Mail;
use App\Mail\EmailManager;

class NewsletterController extends Controller
{
    public function index(Request $request)
    {
    	$users = User::all();
        $subscribers = Subscriber::all();
    	return view('newsletters.index', compact('users', 'subscribers'));
    }

    public function send(Request $request)
    {
        if (env('MAIL_USERNAME') != null) {
            //sends newsletter to selected users
        	if ($request->has('user_emails')) {
                foreach ($request->user_emails as $key => $email) {
                    $to_email = $request->user_emails;
                    $data = array(
                        'content' => $request->content,
                        'email' => $to_email,
                        );
                    try{
                        $subject = $request->subject;   
                        Mail::send('emails.custom', $data, function($message) use ($to_email, $subject) {
                            $message->to($to_email)
                                    ->subject($subject);
                            $message->from('noreply@kgxpress.com',config('app.name'));
                        });
                        
                    }
                    catch (\Exception $e) {
                        dd($e);
                        flash(translate("Error occur due to some problem"))->error();
                        return back();
                    }
                    
                    
                    
                    
                    // $array['view'] = 'emails.newsletter';
                    // $array['subject'] = $request->subject;
                    // $array['from'] = env('MAIL_USERNAME');
                    // $array['content'] = $request->content;
                    
                    // try {
                    //     Mail::to($email)->queue(new EmailManager($array));
                    // } catch (\Exception $e) {
                    //     flash(translate("Error occur due to some problem"))->error();
                    //     return back();
                    //     // dd($e);
                    // }
            	}
            }

            //sends newsletter to subscribers
            if ($request->has('subscriber_emails')) {
                foreach ($request->subscriber_emails as $key => $email) {
                    $to_email = $request->subscriber_emails;
                    $data = array(
                        'content' => $request->content,
                        'email' => $to_email,
                        );
                    try{
                        $subject = $request->subject;   
                        Mail::send('emails.custom', $data, function($message) use ($to_email, $subject) {
                            $message->to($to_email)
                                    ->subject($subject);
                            $message->from('noreply@kgxpress.com',config('app.name'));
                        });
                        
                    }
                    catch (\Exception $e) {
                        dd($e);
                        flash(translate("Error occur due to some problem"))->error();
                        return back();
                    }
                    
                    
                    
                    // $array['view'] = 'emails.newsletter';
                    // $array['subject'] = $request->subject;
                    // $array['from'] = env('MAIL_USERNAME');
                    // $array['content'] = $request->content;

                    // try {
                    //     Mail::to($email)->queue(new EmailManager($array));
                    // } catch (\Exception $e) {
                    //      flash(translate("Error occur due to some problem"))->error();
                    //     return back();
                    //     //dd($e);
                    // }
            	}
            }
        }
        else {
            flash(translate('Please configure SMTP first'))->error();
            return back();
        }

    	flash(translate('Newsletter has been send'))->success();
    	return redirect()->route('admin.dashboard');
    }
}
