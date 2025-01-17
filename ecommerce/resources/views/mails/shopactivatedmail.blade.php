@component('mail::message')
# Congratulations

You shop is now activated.

@component('mail::button', ['url' => ''])
visit here
@endcomponent

Thanks,<br>
{{ config('app.name') }}
@endcomponent
